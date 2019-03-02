package in.quallit.securityDemo.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import in.quallit.securityDemo.entities.User;

import java.util.Optional;

/**
 * @author JIGS
 */
@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    Optional<User> findByEmail(String email);
}
